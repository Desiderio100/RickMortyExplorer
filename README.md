# Índice del Multiverso

App de iOS hecha en SwiftUI que consume la API pública de Rick and Morty. Muestra la lista de personajes, permite filtrarlos por estado, buscarlos por nombre, ver el detalle de cada uno y guardarlos en favoritos.

## Funciones

- **Explorar:** lista de personajes con imagen, nombre, especie y estado.
- **Filtro por estado:** Todos, Vivo, Muerto o Desconocido.
- **Búsqueda** por nombre.
- **Detalle (segundo nivel):** al tocar un personaje se abre su pantalla con imagen, estado, especie, género, origen, ubicación y número de episodios.
- **Guardados:** personajes marcados desde el detalle.
- **Info:** muestra el endpoint de la API y la arquitectura de la app.
- **Carga:** se muestra "Cargando personajes…" mientras llegan los datos y un indicador en cada imagen mientras se descarga.
- **Errores:** mensaje de "Sin conexión" cuando no hay internet, "Error del servidor" con el código HTTP cuando falla la API, y un botón para reintentar.

## API

- [The Rick and Morty API](https://rickandmortyapi.com/) (gratuita, no necesita llave)
- Endpoint: [`GET https://rickandmortyapi.com/api/character`](https://rickandmortyapi.com/api/character)
- Documentación: https://rickandmortyapi.com/documentation/#character

## Estructura (MVVM)

```
RickMortyExplorer/
    App/
        RickMortyExplorerApp.swift      Punto de entrada y pestañas
    Models/
        ShowCharacter.swift             Modelo del personaje
    Services/
        CharacterService.swift          Petición GET a la API
        APIError.swift                  Errores con mensaje para el usuario
    ViewModels/
        CharacterListViewModel.swift    Datos, carga, error, filtro y búsqueda
        FavoritesStore.swift            Personajes guardados
    Views/
        CharacterListView.swift         Lista (nivel 1)
        CharacterDetailView.swift       Detalle (nivel 2)
        CharacterRowView.swift          Fila de la lista
        CharacterImageView.swift        Imagen con indicador de carga
        StatusBadge.swift               Etiqueta de estado
        StateViews.swift                Pantallas de carga y error
        FavoritesView.swift             Pestaña Guardados
        AboutView.swift                 Pestaña Info
        Theme.swift                     Color y estilo de tarjeta
```

- **Model:** `ShowCharacter` tiene los mismos campos que el JSON.
- **Service:** `CharacterService` hace la petición, revisa el código HTTP y convierte las fallas en `APIError`.
- **ViewModel:** `CharacterListViewModel` pide los datos y guarda el estado de la pantalla.
- **View:** las vistas solo muestran lo que tiene el ViewModel.

## Requisitos

- Xcode 16 o posterior
- iOS 17.0 o posterior
- Conexión a internet

## Cómo correrla

1. Clona el repositorio.
2. Abre `RickMortyExplorer.xcodeproj` en Xcode.
3. Elige un simulador de iPhone.
4. Presiona Cmd + R.

Para probar los errores:

- **Sin conexión:** apaga el Wi-Fi de la Mac y vuelve a abrir la app.
- **Error del servidor:** cambia `CharacterService.endpoint` por una ruta que no exista (por ejemplo `.../api/characterx`) y corre la app. Después regrésalo como estaba.

## Clean Code

Los comentarios `Clean Code:` en el código indican dónde se aplica cada práctica:

- Responsabilidad única: el servicio solo habla con la API.
- La lógica está en el ViewModel y no en las vistas.
- Vistas pequeñas y reutilizables (`CharacterRowView`, `DetailRow`, `ErrorView`).
- El estilo de tarjeta y la imagen se definen una vez y se reutilizan.
