import { NestMiddleware, HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { NextFunction, Request, Response } from "express";
import { AdministratorService } from "src/services/administrator/administrator.service";
import * as jwt from 'jsonwebtoken';
import { JwtDataAdministratorDto } from "src/dtos/administrator/jwt.data.administrator";
import { jwtSecret } from "config/jwt.secret";

@Injectable()
export class AuthMiddleware implements NestMiddleware {
    constructor(private readonly administratorService: AdministratorService) { }

    async use(req: Request, res: Response, next: NextFunction) {
        

        if (!req.headers.authorization) {
            throw new HttpException('Token not found', HttpStatus.UNAUTHORIZED);
        }

        const token = req.headers.authorization;

        const tokenParts = token.split(' ');
        if (tokenParts.length !==2) {
            throw new HttpException('Bad not found', HttpStatus.UNAUTHORIZED);

        }

        const tokenString = tokenParts[1];

        const jwData: JwtDataAdministratorDto = jwt.verify(tokenString, jwtSecret);
        if (!jwData) {
            throw new HttpException('Bad not found', HttpStatus.UNAUTHORIZED);
        }

        
        if (jwData.ip !== req.ip.toString()) {
            throw new HttpException('Bad not found', HttpStatus.UNAUTHORIZED);

        }

        if (jwData.ua !== req.headers["user-agent"]) {
            throw new HttpException('Bad not found', HttpStatus.UNAUTHORIZED);

        }

        const administrator = await this.administratorService.getById(jwData.administratorId);
        if (!administrator) {
            throw new HttpException('Account not found', HttpStatus.UNAUTHORIZED);    
        }

        const trenutniTimestamp = new Date().getTime() / 1000;

        if (trenutniTimestamp >= jwData.ext) {
            throw new HttpException('The token has expired', HttpStatus.UNAUTHORIZED);  

        }
        
        next();
    }
    
}