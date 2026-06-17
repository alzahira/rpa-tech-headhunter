\# 🤖 RPA Tech Headhunter: Captación Inteligente de Talento IT



Orquestador autónomo \*End-to-End\* que combina RPA de escritorio, bases de datos relacionales en la nube e Inteligencia Artificial (LLMs) para rastrear, filtrar y evaluar ofertas de desarrollo de software multiplataforma.



\## 🛠️ Stack Tecnológico

\* \*\*Frontend / RPA:\*\* Power Automate Desktop (RPA), Microsoft Edge.

\* \*\*Backend / Orquestación:\*\* n8n (Node-based workflows).

\* \*\*Inteligencia Artificial:\*\* Groq API / LLMs (Procesamiento de Lenguaje Natural).

\* \*\*Base de Datos:\*\* Supabase (PostgreSQL) con mantenimiento autónomo (`pg\_cron`).

\* \*\*Control Remoto:\*\* Google Sheets (Keywords dinámicas).



\## 🚀 Arquitectura del Sistema

1\. \*\*Extracción (PAD):\*\* El script en `Robin` se ejecuta desatendidamente vía CRON de Windows, raspando el DOM de portales dinámicos (InfoJobs, Tecnoempleo).

2\. \*\*Evaluación (n8n + IA):\*\* Un orquestador cloud recibe los payloads HTTP, aplicando reglas de exclusión y pasando la vacante por un modelo de IA para generar un `Match Score` acorde a mi perfil técnico (Java, C#, Python, JS).

3\. \*\*Persistencia (Supabase):\*\* Almacenamiento con lógicas `UPSERT` para evitar duplicados.

4\. \*\*Reporte (SMTP):\*\* Generación automática de un digest diario en formato HTML maquetado con las ofertas de mayor prioridad.



\## 📂 Estructura del Repositorio

\* `/rpa\_bot`: Contiene el código fuente de las rutinas de web scraping.

\* `/n8n\_workflows`: Archivos JSON importables directamente a cualquier instancia de n8n.

\* `/database`: Scripts SQL para la creación del esquema y tareas programadas.



\*Desarrollado por Javier Jaenes Molina.\*

