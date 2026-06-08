import { useEffect,useState,} from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { getUserApi,updateUserApi,} from '../api';
import './AccountSettings.css';

export function UpdateAccount() {
  const { login, token } = useAuth();
  const [usuario, setUsuario] = useState<any>(null);
  const [novoNome, setNovoNome] = useState('');
  const [novaSenha, setNovaSenha] = useState('');
  const [novoTipo, setNovoTipo] = useState('');
  const [erroAtualizacao,setErroAtualizacao] = useState('');

  useEffect(() => {
    carregarUsuario();
  }, []);

  async function carregarUsuario() {
    if (!token || !login) return;
    try {
      const dados = await getUserApi(login,token);
      setUsuario(dados);
    } catch (e: any) {
      setErroAtualizacao(
        e.response?.data?.message ||
        'Erro ao carregar usuário.'
      );
    }
  }

  async function salvarAlteracoes() {
    if (!token || !login) return;
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
      const resposta =
        await updateUserApi(
          login,
          dadosAtualizacao,
          token
        );
      alert(resposta.message);
      setErroAtualizacao('');
      setNovoNome('');
      setNovaSenha('');
      setNovoTipo('');

      await carregarUsuario();
    } catch (e: any) {
      const mensagem =
        e.response?.data?.message ||
        'Erro ao atualizar conta.';
      setErroAtualizacao(
        Array.isArray(mensagem)
          ? mensagem[0]
          : mensagem
      );
    }
  }

  return (
    <div className="account-container">
      <h1>Atualizar Conta</h1>

      {usuario && (
        <>
          <h2>Dados Atuais</h2>
          <p><strong>Login:</strong>{' '} {usuario.login}</p>
          <p><strong>Nome:</strong>{' '}{usuario.name}</p>
          <p><strong>Senha:</strong>{' '}{usuario.password}</p>
          <p><strong>Email:</strong>{' '}{usuario.email}</p>
          <p><strong>Tipo de Conta:</strong>{' '}{usuario.tipodeconta}</p>
        </>
      )}

      <input
        className="account-input"
        placeholder="Novo nome"
        value={novoNome}
        onChange={(e) =>
          setNovoNome(
            e.target.value
          )
        }
      />

      <input
        className="account-input"
        type="password"
        placeholder="Nova senha"
        value={novaSenha}
        onChange={(e) =>
          setNovaSenha(
            e.target.value
          )
        }
      />

      <select
        className="account-input"
        value={novoTipo}
        onChange={(e) =>
          setNovoTipo(
            e.target.value
          )
        }
      >
        <option value="">
          Não alterar tipo de conta
        </option>
        <option value="OUVINTE">
          OUVINTE
        </option>
        <option value="ARTISTA">
          ARTISTA
        </option>
        <option value="PODCAST">
          PODCAST
        </option>
      </select>

      <button className="account-btn" onClick={salvarAlteracoes}>
        Salvar Alterações
      </button>

      {erroAtualizacao && (
        <p className="erro">
          {erroAtualizacao}
        </p>
      )}

      <br />
      <br />

      <Link to="/conta">
        Voltar para Configurações
      </Link>
    </div>
  );
}