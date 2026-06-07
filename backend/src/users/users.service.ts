import { Injectable, NotFoundException, UnauthorizedException, BadRequestException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { RemoveUserDto } from './dto/remove-user.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User, UserRole } from './entities/user.entity';
@Injectable()
export class UsersService {
  constructor(
  @InjectRepository(User)
  private usersRepository: Repository<User>,) {}

  async create(createUserDto: CreateUserDto) {
    const newUser = this.usersRepository.create(createUserDto) //assim usa o dto com a entidade
    return await this.usersRepository.save(newUser) //save faz insert no banco de dados
  }

  findAll() {
    return this.usersRepository.find()
  }

  async findByLogin(login: string) {
    //findByLogin retorna o usuário OU null se não encontrar, sem jogar erros
    return await this.usersRepository.findOneBy({ login });
  }

  async findByEmail(email: string) {
    return this.usersRepository.findOne({
      where: { email },
    });
  }

  async findOne(login: string) {
    const user = await this.usersRepository.findOneBy({login})
        if(!user){throw new NotFoundException('User not found')}
        return user
  }

  async update(login: string, updateUserDto: UpdateUserDto) {
    const user = await this.findOne(login) //garante que o usuario existe ou lanca notfoundexception
    const fieldNames = {
    login: 'login',
    name: 'nome',
    password: 'senha',
    email: 'e-mail',
    tipodeconta: 'tipo de conta',
  };
    const fieldsToUpdate = Object.entries(updateUserDto).filter(
    ([_, value]) => value !== undefined && value !== null && value !== '',
  );

  if (fieldsToUpdate.length === 0) {
    throw new BadRequestException(
      'Não é possível realizar uma atualização sem preencher nenhum campo.',
    );
  }

  const equalFields = fieldsToUpdate
  .filter(([key, value]) => user[key] === value)
  .map(([key]) => fieldNames[key] ?? key);

if (equalFields.length > 0) {
  throw new BadRequestException(
    `Não é possível atualizar os seguintes campos com o mesmo valor atual: ${equalFields.join(', ')}.`,
  );
}

    Object.assign(user,updateUserDto) //sobreescreve os campos enviados
    const updatedUser = await this.usersRepository.save(user);

    return {
      message: 'Dados atualizados com sucesso.',
      user: updatedUser,
    }; 
  }

  async remove(login: string, removeUserDto: RemoveUserDto) {
  const removedUser = await this.findOne(login);
  if (removedUser.password !== removeUserDto.password){throw new UnauthorizedException('Senha incorreta. Insira a senha correta para realizar a remoção da conta.');}
  await this.usersRepository.remove(removedUser);
  return {
    message: 'A conta foi removida do sistema com sucesso.',
    user: removedUser,
  };
}
  async promote(login: string) {
    const user = await this.findOne(login);
    user.tipodeconta = UserRole.ADMIN;
    return this.usersRepository.save(user);
  }
}
