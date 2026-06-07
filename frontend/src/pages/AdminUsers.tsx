import { useEffect, useState, useCallback } from 'react';
import { getUsersApi, updateUserApi, removeUserApi, registerApi } from '../api';
import { useAuth } from '../contexts/AuthContext';
import { Link } from 'react-router-dom';
import './AdminUsers.css';

export function AdminUsers() {
  const [usuarios, setUsuarios] = useState<any[]>([]);
  const [erro, setErro] = useState('');
  const { token } = useAuth();
  const [usuarioEditando, setUsuarioEditando] = useState<any>(null);
  const [novoNome, setNovoNome] = useState('');
  const [novaSenha, setNovaSenha] = useState('');
  const [novoTipo, setNovoTipo] = useState('');
  const [erroAtualizacao, setErroAtualizacao] = useState('');
  const [senhaRemocao, setSenhaRemocao] = useState('');
  const [erroRemocao, setErroRemocao] = useState('');
  const [inserindoUsuario, setInserindoUsuario] = useState(false);
  const [loginNovoUsuario, setLoginNovoUsuario] = useState('');
  const [nomeNovoUsuario, setNomeNovoUsuario] = useState('');
  const [senhaNovoUsuario, setSenhaNovoUsuario] = useState('');
  const [emailNovoUsuario, setEmailNovoUsuario] = useState('');
  const [tipoNovoUsuario, setTipoNovoUsuario] = useState('OUVINTE');
  const [erroInsercao, setErroInsercao] = useState('');

  function selecionarUsuario(usuario: any) {
    setErroAtualizacao('');
    setInserindoUsuario(false);
    setUsuarioEditando(usuario);
    setNovoNome(usuario.name);
    setNovaSenha('');
    setNovoTipo(usuario.tipodeconta);
  }

  async function inserirUsuario() {
  try {
    await registerApi(
      loginNovoUsuario,
      nomeNovoUsuario,
      senhaNovoUsuario,
      emailNovoUsuario,
      tipoNovoUsuario,
    );
    setErroInsercao('');
    setLoginNovoUsuario('');
    setNomeNovoUsuario('');
    setSenhaNovoUsuario('');
    setEmailNovoUsuario('');
    setTipoNovoUsuario('OUVINTE');
    setInserindoUsuario(false);
    await carregarUsuarios();
    alert('Usuário inserido.');
  } catch (e: any) {
    const mensagem =
      e.response?.data?.message ||
      'Erro ao inserir usuário.';
    setErroInsercao(
      Array.isArray(mensagem)
        ? mensagem[0]
        : mensagem,
    );
  }
}

  function cancelarEdicao() {
  setUsuarioEditando(null);
  setErroAtualizacao('');
  setNovoNome('');
  setNovaSenha('');
  setNovoTipo('');
  }

  async function salvarAlteracoes() {
  if (!token) return;

  const dadosAtualizacao: any = {};

  if (novoNome.trim() !== '') {
    dadosAtualizacao.name = novoNome;
  }

  if (novaSenha.trim() !== '') {
    dadosAtualizacao.password = novaSenha;
  }

  if (novoTipo !== '') {
    dadosAtualizacao.tipodeconta = novoTipo;
  }

  if (Object.keys(dadosAtualizacao).length === 0) {
    alert('Preencha pelo menos um campo para atualizar.');
    return;
  }

  try {
    await updateUserApi(
      usuarioEditando.login,
      dadosAtualizacao,
      token,
    );
    setErroAtualizacao('');
    await carregarUsuarios();
    alert('Usuário atualizado.');
    setUsuarioEditando(null);
  } catch (e: any) {
  const mensagem =
    e.response?.data?.message ||
    'Erro ao atualizar usuário.';

  setErroAtualizacao(
    Array.isArray(mensagem)
      ? mensagem[0]
      : mensagem
  );
}
}

const carregarUsuarios = useCallback(async () => {
  if (!token) return;

  try {
    const dados = await getUsersApi(token);
    setUsuarios(dados);
  } catch {
    setErro('Erro ao carregar usuários');
  }
}, [token]);

 useEffect(() => {
  carregarUsuarios();
}, [carregarUsuarios]);

async function removerUsuario() {
  if (!token || !usuarioEditando) return;

  try {
    await removeUserApi(
      usuarioEditando.login,
      senhaRemocao,
      token,
    );

    setErroRemocao('');
    setSenhaRemocao('');
    setUsuarioEditando(null);

    await carregarUsuarios();

    alert('Usuário removido.');
  } catch (e: any) {
    const mensagem =
      e.response?.data?.message ||
      'Erro ao remover usuário.';

    setErroRemocao(
      Array.isArray(mensagem)
        ? mensagem[0]
        : mensagem,
    );
  }
}

  return (
    <div>
      <h1>Gerenciamento de Usuários</h1>

      {erro && <p>{erro}</p>}

      <table className="admin-table">
        <thead>
          <tr>
            <th>Login</th>
            <th>Nome</th>
            <th>Senha</th>
            <th>Email</th>
            <th>Tipo de Conta</th>
          </tr>
        </thead>

        <tbody>
          {usuarios.map(usuario => (
            <tr key={usuario.login}>
              <td>{usuario.login}</td>
              <td>{usuario.name}</td>
              <td>{usuario.password}</td>
              <td>{usuario.email}</td>
              <td>{usuario.tipodeconta}</td>
              <td><button onClick={() => selecionarUsuario(usuario)}>Editar</button></td>
            </tr>
          ))}
        </tbody>
      </table>
      {!usuarioEditando && !inserindoUsuario && (
          <button onClick={() => setInserindoUsuario(true)}>
            Inserir Usuário
          </button>
        )}
      {usuarioEditando && (
        <div className="editar-usuario">

            <h2>Editar Usuário</h2>

            <p>Login: {usuarioEditando.login}</p>

            <input
            placeholder="Nome"
            value={novoNome}
            onChange={e => setNovoNome(e.target.value)}
            />

            <input
            type="password"
            placeholder="Nova senha"
            value={novaSenha}
            onChange={e => setNovaSenha(e.target.value)}
            />

            <select
            value={novoTipo}
            onChange={e => setNovoTipo(e.target.value)}
            >
            <option value="OUVINTE">OUVINTE</option>
            <option value="ARTISTA">ARTISTA</option>
            <option value="PODCAST">PODCAST</option>
            <option value="ADMIN">ADMIN</option>
            </select>
            <div className="acoes-edicao">
            <button onClick={salvarAlteracoes}>
            Salvar
            </button>
            <button onClick={cancelarEdicao}>
            Cancelar
          </button>
          </div>
          <hr />
          <h3>Remover Usuário</h3>

          <input
            type="password"
            placeholder="Confirme a senha"
            value={senhaRemocao}
            onChange={e => setSenhaRemocao(e.target.value)}
          />

          <button onClick={removerUsuario}>
            Remover Usuário
          </button>

          {erroRemocao && (
            <p className="erro">
              {erroRemocao}
            </p>
          )}
        </div>
        )}
        {inserindoUsuario && (
        <div className="editar-usuario">

          <h2>Inserir Usuário</h2>

          <input
            placeholder="Login"
            value={loginNovoUsuario}
            onChange={e => setLoginNovoUsuario(e.target.value)}
          />

          <input
            placeholder="Nome"
            value={nomeNovoUsuario}
            onChange={e => setNomeNovoUsuario(e.target.value)}
          />

          <input
            type="password"
            placeholder="Senha"
            value={senhaNovoUsuario}
            onChange={e => setSenhaNovoUsuario(e.target.value)}
          />

          <input
            placeholder="Email"
            value={emailNovoUsuario}
            onChange={e => setEmailNovoUsuario(e.target.value)}
          />

          <select
            value={tipoNovoUsuario}
            onChange={e => setTipoNovoUsuario(e.target.value)}
          >
            <option value="OUVINTE">OUVINTE</option>
            <option value="ARTISTA">ARTISTA</option>
            <option value="PODCAST">PODCAST</option>
            <option value="ADMIN">ADMIN</option>
          </select>

          <div className="acoes-edicao">
            <button onClick={inserirUsuario}>
              Inserir
            </button>

            <button onClick={() => setInserindoUsuario(false)}>
              Cancelar
            </button>
          </div>

          {erroInsercao && (
            <p className="erro">
              {erroInsercao}
            </p>
          )}

        </div>
      )}
        {erroAtualizacao && (
        <p className="erro">
            {erroAtualizacao}
        </p>
        )}
      <Link to="/" >
      Voltar para Home
     </Link>
    </div>
  );
}