import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { updateUserApi, removeUserApi } from '../api';
import './AccountSettings.css'

export function AccountSettings() {
  const { login, token, tipodeconta, sair } = useAuth();
  const navigate = useNavigate();
  const [novoNome, setNovoNome] = useState('');
  const [novaSenha, setNovaSenha] = useState('');
  const [novoTipo, setNovoTipo] = useState('');
  const [senhaRemocao, setSenhaRemocao] = useState('');
  const [erroAtualizacao, setErroAtualizacao] = useState('');
  const [erroRemocao, setErroRemocao] = useState('');

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
      const resposta = await updateUserApi(
        login,
        dadosAtualizacao,
        token,
      );
      alert(resposta.message);
      setErroAtualizacao('');
      setNovaSenha('');
    } catch (e: any) {
      const mensagem =
        e.response?.data?.message ||
        'Erro ao atualizar conta.';
      setErroAtualizacao(
        Array.isArray(mensagem)
          ? mensagem[0]
          : mensagem,
      );
    }
  }
  async function removerConta() {
    if (!token || !login) return;
    try {
      await removeUserApi(
        login,
        senhaRemocao,
        token,
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
          : mensagem,
      );
    }
  }

  return (
    <div className="account-container">
      <h1>Configurações da Conta</h1>
      <h2>Atualizar Dados</h2>
      <p>Login: {login}</p>
      <input className="account-input"
        placeholder="Novo nome"
        value={novoNome}
        onChange={e => setNovoNome(e.target.value)}
      />
      <input className="account-input"
        type="password"
        placeholder="Nova senha"
        value={novaSenha}
        onChange={e => setNovaSenha(e.target.value)}
      />
      <select className="account-input"
        value={novoTipo}
        onChange={e => setNovoTipo(e.target.value)}
      >
        <option value="">Não alterar tipo de conta</option>
        <option value="OUVINTE">OUVINTE</option>
        <option value="ARTISTA">ARTISTA</option>
        <option value="PODCAST">PODCAST</option>
      </select>
      <button className="account-btn" onClick={salvarAlteracoes}>
        Salvar Alterações
      </button>
      {erroAtualizacao && (
        <p className="erro">
          {erroAtualizacao}
        </p>
      )}
      <hr />
      <h2>Excluir Conta</h2>
      <p>
        Esta ação é permanente e não poderá ser desfeita.
      </p>
      <input className="account-input"
        type="password"
        placeholder="Confirme sua senha"
        value={senhaRemocao}
        onChange={e => setSenhaRemocao(e.target.value)}
      />
      <button className="account-btn-danger" onClick={removerConta}>
        Excluir Conta
      </button>
      {erroRemocao && (
        <p className="erro">
          {erroRemocao}
        </p>
      )}
      <br />
      <br />
      <Link to="/">
        Voltar para Home
      </Link>

    </div>
  );
}