# 🌦️ WeatherApi GSE

Aplicación desarrollada por Miguel Angel Molina como **prueba técnica para GSE**, utilizando:

- **Flutter** (Riverpod + Dio)  
- **Visual Crossing Weather API**  
- **Google Maps SDK**  
- **Arquitectura limpia**, pruebas unitarias, providers, datasources y repositorios.

La app permite consultar el clima, ver reportes históricos, y eventos de una locación específica. 

---

## 🚀 Requisitos previos

- Flutter SDK instalado  
- Dart >= 3.x

## 🔑 APIs utilizadas

Este proyecto hace uso de dos claves API externas:

- **API key de VisualCrossing Weather API**  
  Utilizada para obtener reportes y eventos meteorológicos.  
  Documentación oficial:  
  👉 https://www.visualcrossing.com/resources/documentation/weather-api/timeline-weather-api/#request-endpoints

- **API key de Google Maps**  
  Utilizada para mapas interactivos y geocodificación dentro de la app.  
  Consola de Google Cloud:  
  👉 https://console.cloud.google.com/
  
---

## 🔧 Configuración inicial

### 1. Configurar variables de entorno

Duplicar el archivo: 

```.env.template``` 

Renombrarlo a: 

```.env```


Y colocar tu API key:

```env
THE_WEATHERAPI_KEY="TU_API_KEY_AQUI"
```
La app usa flutter_dotenv para leer esta configuración.


## 🌍 Google Maps API Key


Se incluye una **API Key ya configurada y restringida únicamente** para este proyecto, con el objetivo de facilitar la evaluación.


## ▶️ Ejecutar el proyecto

Instalar dependencias:

```bash
flutter pub get
```

## ▶️ Ejecutar

```bash
flutter run
```


## 🧪 Ejecutar pruebas unitarias

Este proyecto contiene pruebas para:

- Datasources (Reportes y Eventos)  
- Providers (Report & Event State)

Para correrlas utiliza:
```bash
flutter test
```

---

## 🏗️ Arquitectura

La app está organizada siguiendo principios de **Clean Architecture**:

### **Domain**
- Casos de uso en Datasource
- Entidades (`Report`, `Event`)
- Repositorios abstractos

### **Infrastructure**
- Datasources utilizando **Dio**
- Mappers
- Implementación de repositorios

### **Presentation**
- Providers con **Riverpod**
- UI (screens, widgets)

---

## 📡 Consumo de APIs

Se utiliza **Visual Crossing Weather API** para:

### **Reportes del clima**
``GET /timeline/{location}/last25ays``

### **Eventos meteorológicos**
``GET /timeline/{location}/{start}/{end}?include=events``

Las respuestas se transforman en entidades internas mediante los mappers del proyecto, junto con algunos otros parámetros que son pasados a la petición..

---

## 🗺️ Funcionalidad con Google Maps

- Mapa interactivo  
- Marcadores dinámicos  
- Visualización de eventos por ubicación  
- Ubicación del usuario (si está habilitada)

La API Key incluida está **restringida** para funcionar únicamente con esta app. 
(Posterior al feedback del equipo evaluador, se procederá a desactivar)

---

## 📦 Principales librerías utilizadas

- `flutter_riverpod`
- `dio`
- `flutter_dotenv`
- `google_maps_flutter`
- `mockito` / `mocktail`
- `build_runner`

---


## 📄 Licencia

Proyecto creado exclusivamente como prueba técnica.  
El código puede ser utilizado con fines educativos.
