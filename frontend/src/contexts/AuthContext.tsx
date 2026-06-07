import { createContext, useContext, useState, ReactNode } from 'react';

interface AuthContextType {
  login:     string | null;
  token:     string | null;
  tipodeconta: string | null;
  entrar:    (login: string, token: string, tipodeconta: string) => void;
  sair:      () => void;
  logado:    boolean;
}

const AuthContext = createContext<AuthContextType>({} as AuthContextType);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [login, setLogin] = useState<string | null>(null);
  const [token, setToken] = useState<string | null>(null);
  const [tipodeconta, settipodeconta] = useState<string | null>(null);

  function entrar(login: string, token: string, tipodeconta:string) {
    setLogin(login);
    setToken(token);
    settipodeconta(tipodeconta);
  }

  function sair() {
    setLogin(null);
    setToken(null);
    settipodeconta(null)
  }

  return (
    <AuthContext.Provider value={{
      login,
      token,
      tipodeconta,
      entrar,
      sair,
      logado: !!token,
    }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  return useContext(AuthContext);
}