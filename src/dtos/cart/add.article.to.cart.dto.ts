import { Post } from "@nestjs/common";

export class AddArticleToCartDto {
    articleId: number;
    quantity: number;
}