import { Post } from "@nestjs/common";

export class EditArticleInCartDto {
    articleId: number;
    quantity: number;
}