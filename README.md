# Astronomy Pictures

Bem-vindo ao **Astronomy Pictures**! Este projeto foi desenvolvido durante uma série de vídeos no YouTube, onde mostramos o passo a passo do desenvolvimento utilizando Flutter. O aplicativo se conecta à API APOD (Astronomy Picture of the Day) da NASA para exibir imagens astronômicas diárias.

## 📺 Playlist no YouTube

Confira a série de vídeos completa no YouTube:
[![YouTube](https://img.shields.io/badge/YouTube-Playlist-red)](https://www.youtube.com/playlist?list=PLAnsuxKA_JPYa_ALf-u0FZzw3VYXBvqHg)

## ✨ Funcionalidades

- **Scroll infinito de imagens aleatórias**: Permite visualizar imagens do espaço em um scroll infinito.
- **Imagem do dia**: Exibe a imagem astronômica em destaque do dia, fornecida pela API APOD da NASA.
- **Pesquisa de imagens**: Possibilita a busca por imagens específicas.
- **Favoritar e salvar imagens**: Permite favoritar e salvar as imagens localmente para visualização offline.

## 🛠️ Ferramentas e Tecnologias Utilizadas

### Plugins

- **cupertino_icons**
- **dartz**
- **equatable**
- **mockito**
- **http**
- **internet_connection_checker**
- **get_it**
- **video_player**
- **youtube_player_flutter**
- **vimeo_video_player**
- **gallery_saver**
- **share_plus**
- **shared_preferences**
- **timezone**
- **syncfusion_flutter_datepicker**

### API

- **NASA APOD (Astronomy Picture of the Day)**: Utilizada para obter as imagens astronômicas diárias. [Documentação da API](https://api.nasa.gov/).

## 🏛️ Arquitetura

Este projeto segue a **Clean Architecture**, que se caracteriza por:

- **Separação de responsabilidades**: Divisão clara entre camadas de domínio, dados e apresentação.
- **Independência de frameworks**: As camadas de domínio e dados não dependem de detalhes de frameworks, permitindo fácil portabilidade.
- **Testeabilidade**: Facilita a escrita de testes automatizados, garantindo um código mais robusto.

### Camadas da Clean Architecture

1. **Camada de Domínio**: Contém entidades, casos de uso e interfaces de repositório.
2. **Camada de Dados**: Implementa as interfaces de repositório, contém fontes de dados (API, banco de dados, etc.).
3. **Camada de Apresentação**: Contém a lógica de apresentação (ViewModels, Controllers) e as interfaces de usuário (Widgets).

## 🔄 Controle de Estado

Este projeto utiliza o padrão **BLoC (Business Logic Component)** para gerenciar o estado da aplicação. O BLoC separa a lógica de negócios da interface de usuário, tornando o código mais organizado e facilitando a manutenção e testes.

### Vantagens do BLoC:

- **Separação de preocupações**: Mantém a lógica de negócios separada da camada de apresentação.
- **Reutilização de código**: Facilita a reutilização de componentes de lógica de negócios.
- **Testeabilidade**: A lógica de negócios pode ser testada de forma independente da interface de usuário.
- **Consistência**: Garante que a lógica de negócios é consistente em toda a aplicação.

## 🧪 Método de Desenvolvimento

Adotamos o **Desenvolvimento Guiado por Testes (TDD)**, que segue três etapas principais:

1. **Escrever um teste**: Antes de escrever qualquer funcionalidade, escrevemos um teste que falha inicialmente.
2. **Fazer o teste passar**: Implementamos o código mínimo necessário para fazer o teste passar.
3. **Refatorar**: Melhoramos o código mantendo os testes verdes.

Esta abordagem garante um código mais confiável e facilita a manutenção e evolução do projeto.

## 🔧 Faça um Fork e Melhore

Sinta-se à vontade para fazer um fork deste projeto e melhorar onde você acha que pode ser melhora, seja no desing, na logica ou na estrutura. Se você tiver ideias ou melhorias, este é um ótimo ponto de partida para aprender e experimentar com Flutter.

## 📜 Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](./LICENSE) para mais detalhes.
