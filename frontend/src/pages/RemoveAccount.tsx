import {useEffect,useState,} from 'react';
import {Link,useNavigate,} from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import {getUserApi,removeUserApi,} from '../api';

import './AccountSettings.css';

export function RemoveAccount() {
  const {login,token,sair,} = useAuth();
  const navigate = useNavigate();
  const [usuario, setUsuario] = useState<any>(null);
  const [senhaRemocao, setSenhaRemocao] = useState('');
  const [erroRemocao, setErroRemocao] = useState('');

  useEffect(() => {
    carregarUsuario();
  }, []);

  async function carregarUsuario() {
    if (!token || !login) return;

    try {
      const dados =
        await getUserApi(
          login,
          token
        );
      setUsuario(dados);
    } catch (e: any) {
      setErroRemocao(
        e.response?.data?.message ||
        'Erro ao carregar usuário.'
      );
    }
  }
  async function removerConta() {
    if (!token || !login) return;
    try {
      await removeUserApi(
        login,
        senhaRemocao,
        token
      );
      alert('Conta removida com sucesso.');
      sair();
      navigate('/');
    } catch (e: any) {
      const mensagem =
        e.response?.data?.message ||
        'Erro ao remover conta.';

      setErroRemocao(
        Array.isArray(mensagem)
          ? mensagem[0]
          : mensagem
      );
    }
  }

  return (
    <div className="account-container">
      <h1>Remover Conta</h1>

      {usuario && (
        <>
          <h2>Dados da Conta</h2>
          <p><strong>Login:</strong>{' '} {usuario.login}</p>
          <p><strong>Nome:</strong>{' '}{usuario.name}</p>
          <p><strong>Email:</strong>{' '}{usuario.email}</p>
          <p><strong>Tipo de Conta:</strong>{' '}{usuario.tipodeconta}</p>
        </>
      )}

      <p>
        Esta ação é permanente e não poderá ser
        desfeita.
      </p>
      <input
        className="account-input"
        type="password"
        placeholder="Confirme sua senha"
        value={senhaRemocao}
        onChange={(e) =>
          setSenhaRemocao(
            e.target.value
          )
        }
      />

      <button className="account-btn-danger" onClick={removerConta}>
        Confirmar
      </button>

      {erroRemocao && (
        <p className="erro">
          {erroRemocao}
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