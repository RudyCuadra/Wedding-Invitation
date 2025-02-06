fetch('/firebase-config.json')
  .then(response => {
    if (!response.ok) {
      throw new Error(`🔥 Error: No se pudo cargar firebase-config.json. Estado HTTP: ${response.status}`);
    }
    return response.json();
  })
  .then(config => {
    firebase.initializeApp(config);
    console.log("✅ Firebase inicializado correctamente.");
  })
  .catch(error => console.error("🔥 Error cargando configuración de Firebase:", error));
