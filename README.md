📰 NYTimes Popular Articles App

Esta es una aplicación iOS desarrollada como parte de un proceso de contratación por parta de Reven.inc.
Su objetivo es consumir la API de los artículos más populares del The New York Times, mostrando la información de manera clara, eficiente y siguiendo buenas prácticas de arquitectura y pruebas.

⸻

🚀 Características
	•	Consulta de los artículos más populares del NYTimes (más vistos, compartidos o enviados).
	•	Visualización en lista con título, resumen, autor e imagen destacada.
	•	Vista detallada con información completa del artículo.
	•	Manejador de errores para respuestas inválidas o fallas de red.

⸻

🛠️ Tecnologías utilizadas
	•	Xcode 16.2
	•	Swift 5
	•	Arquitectura VIPER para mantener una separación clara de responsabilidades en las vistas.
	•	URLSession para las peticiones HTTP.
	•	UIKit como framework base para la interfaz de usuario.

⸻

🧪 Pruebas
	•	Se implementaron pruebas unitarias sobre los módulos clave de la aplicación.
	•	Se logró una cobertura del 70%, validando lógica en interactors, presenters y servicios.
	•	Uso de XCTest como framework de testing.

⸻

📦 Instalación
	1.	Clona el repositorio:

git clone https://github.com/tu-usuario/nytimes-popular-articles-ios.git


	2.	Abre el proyecto en Xcode:

open NYTimesPopularArticles.xcodeproj


	3.	Ejecuta el proyecto en el simulador o dispositivo.

⸻

✨ Estructura del proyecto
	•	Views/: Cada módulo de vista estructurado según VIPER (View, Interactor, Presenter, Entity, Router).
  •	Common/: Helpers de la aplicaiòn.
	•	Common/Network/: Capa de servicios para consumir la API del NYT.
	•	Tests/: Pruebas unitarias organizadas por módulo.

⸻

📄 Licencia

Este proyecto fue desarrollado con fines demostrativos y no está afiliado oficialmente a The New York Times.
