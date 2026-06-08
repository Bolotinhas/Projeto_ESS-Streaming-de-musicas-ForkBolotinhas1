import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { getUserApi } from '../api';
import './AccountSettings.css';

export function AccountSettings() {
  const { login, token } = useAuth();

  const [usuario, setUsuario] = useState<any>(null);
  const [erro, setErro] = useState('');

  useEffect(() => {
    carregarUsuario();
  }, []);

  async function carregarUsuario() {
    if (!token || !login) return;

    try {
      const dados = await getUserApi(
        login,
        token
      );

      setUsuario(dados);
    } catch (e: any) {
      setErro(
        e.response?.data?.message ||
        'Erro ao carregar dados da conta.'
      );
    }
  }

  return (
    <div className="account-container">
      <h1>Configurações da Conta</h1>

      {usuario && (
        <>
          <h2>Dados da Conta</h2>
          <p><strong>Login:</strong>{' '} {usuario.login}</p>
          <p><strong>Nome:</strong>{' '}{usuario.name}</p>
          <p><strong>Senha:</strong>{' '}{usuario.password}</p>
          <p><strong>Email:</strong>{' '}{usuario.email}</p>
          <p><strong>Tipo de Conta:</strong>{' '}{usuario.tipodeconta}</p>
        </>
      )}

      {erro && (
        <p className="erro">
          {erro}
        </p>
      )}

      <div className="account-actions">
        <Link to="/update-account">
          <button className="account-btn">
            Atualizar Conta
          </button>
        </Link>

        <Link to="/remove-account">
          <button className="account-btn-danger">
            Remover Conta
          </button>
        </Link>
      </div>

      <br />

      <Link to="/">
        Voltar para Home
      </Link>
    </div>
  );
}