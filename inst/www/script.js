function createJSONFrame(message) {
  Shiny.setInputValue("json_frame", message);
}

Shiny.addCustomMessageHandler("createJSONFrame", createJSONFrame);