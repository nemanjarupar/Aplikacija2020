import { Controller, Post, Body, Req} from "@nestjs/common";
import { AdministratorService } from "src/services/administrator/administrator.service";
import { LoginAdministratorDto } from "src/dtos/administrator/login.administrator.dto";
import { ApiResponse } from "src/misc/api.response.class";
import { resolve } from "path";
import * as crypto from 'crypto';
import { LoginInfoAdministratorDto } from "src/dtos/administrator/login.info.administrator.dto";
import * as jwt from 'jsonwebtoken'
import { JwtDataAdministratorDto } from "src/dtos/administrator/jwt.data.administrator";
import { Request } from "express";
import { jwtSecret } from "config/jwt.secret";

@Controller('auth')

export class AuthController {
    constructor(public administratorService: AdministratorService) { }

    @Post('login')
    async doLogin(@Body() data: LoginAdministratorDto, @Req() req: Request): Promise<LoginInfoAdministratorDto | ApiResponse> {
        const administrator = await this.administratorService.getByUsername(data.username);

        if(!administrator) {
            return new Promise(resolve => resolve(new ApiResponse('error', -3001)));
        }

        const passwordHash = crypto.createHash('sha512');
        passwordHash.update(data.password);
        const passwordHashString = passwordHash.digest('hex').toUpperCase();

        if (administrator.passwordHash !== passwordHashString) {
            return new Promise(resolve => resolve(new ApiResponse('error', -3002)));
        }

        const jwData = new JwtDataAdministratorDto();
        jwData.administratorId = administrator.administratorId;
        jwData.username = administrator.username;

        let sada = new Date();
        sada.setDate(sada.getDate() + 14);
        const istekTimestamp = sada.getTime() / 1000;
        jwData.ext = istekTimestamp;

        jwData.ip = req.ip.toString();
        jwData.ua = req.headers["user-agent"];

        
        let token: string = jwt.sign(jwData.toPlainObject(), jwtSecret);

        const responseObject = new LoginInfoAdministratorDto(
            administrator.administratorId,
            administrator.username,
            token
        );

        return new Promise(resolve => resolve(responseObject));

    }
}