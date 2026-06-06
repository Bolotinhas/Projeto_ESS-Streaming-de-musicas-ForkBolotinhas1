import { IsString, MinLength, MaxLength, IsNotEmpty } from "class-validator";

export class RemoveUserDto {
 @IsString()
 @MinLength(3, {message: 'A senha deve ter pelo menos 3 caracteres. Construa outra senha.',})
 @MaxLength(20, {message: 'A senha não pode ter mais de 20 caracteres.'})
 @IsNotEmpty({message: 'O campo senha não pode estar vazio.'})
  password: string;
}