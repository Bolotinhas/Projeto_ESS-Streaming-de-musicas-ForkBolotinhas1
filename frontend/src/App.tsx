import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { AuthProvider }  from './contexts/AuthContext';
import { Home }          from './pages/Home';
import { EmAlta }        from './pages/EmAlta';
import { Busca }         from './pages/Busca';
import { Login }         from './pages/Login';
import { Recomendacoes } from './pages/Recomendacoes';
import { Historico }     from './pages/Historico';
import { Register }      from './pages/Register';
import { AdminUsers }    from './pages/AdminUsers';
import { AccountSettings } from './pages/AccountSettings';
import { UpdateAccount } from './pages/UpdateAccount';
import { RemoveAccount } from './pages/RemoveAccount';

function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/"              element={<Home />}          />
          <Route path="/em-alta"       element={<EmAlta />}        />
          <Route path="/busca"         element={<Busca />}         />
          <Route path="/login"         element={<Login />}         />
          <Route path="/recomendacoes" element={<Recomendacoes />} />
          <Route path="/historico"     element={<Historico />}     />
          <Route path="/auth/login"    element={<Login />}         />
          <Route path="/auth/register" element={<Register />}      />
          <Route path="/admin/users"   element={<AdminUsers />}    />
          <Route path="/conta" element={<AccountSettings />}/>
          <Route path="/update-account" element={<UpdateAccount />}/>
          <Route path="/remove-account" element={<RemoveAccount />}/>
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  );
}


export default App;