# Google Auth Test

## Integrantes da Equipe

- Lucas Eduardo Mueller
- Guilherme Gabriel Freiberger

## Funcionalidades por Telas

### Splash

- Verificar se usuário está autenticado

### Tela de Login

- Login com Google
- Exibição de mensagens de erro em caso de falha no login

### Tela Principal

- Exibição do nome e email do usuário logado
- Botão de logout
- Exibição de mensagens de erro em caso de falha no login

## Tipos de Erros Tratados

- Erro ao fazer login com o Google.
- Falha ao deslogar do usuário.
- O usuário cancelou o login.

### Classes de tratamento

- `SignInAuthException`: Erro ao tentar fazer login com Google, pode ser causado por credenciais inválidas ou problemas de rede.
- `GetCurrentUserAuthException`: Erro ao tentar obter o usuário atual do Firebase.
- `SignOutAuthException`: Erro ao tentar realizar o logout do usuário.

## Dependências Utilizadas

- **Firebase Core**: 3.8.1
- **Firebase Auth**: 5.3.4
- **Google Sign-In**: 6.2.2

## Instruções para Configuração e Execução

### Passos para Configurar o Ambiente

1. Clone o repositório:

2. Navegue até o diretório do projeto:

3. Instale as dependências necessárias:

   ```sh
   flutter pub get
   ```

4. Navegue até a pasta do Android e gere um SHA-1

   ```sh
   cd android
   ./gradlew signingReport
   ```

5. Va no Google Cloud Console

   - Crie uma credencial OAuth
   - Pegue o ID do seu projeto Firebase
   - Coloque a seguinte URIs de redirecionamento
   - `https://{ID do seu Projeto Firebase}.firebaseapp.com/__/auth/handler`

6. Copie o SHA-1 e defina configuração do aplicativo no seu projeto do Firebase

7. Configure o Firebase:

   - Baixe o arquivo `google-services.json` do console do Firebase.
   - Coloque-o na pasta `android/app` do projeto.

8. Execute o projeto:
   ```sh
   flutter run
   ```

## Apk Gerado está em

- `apk\app-release.apk`
