function sendJSONFrame(jsonString) {
  Shiny.setInputValue("json_frame", JSON.stringify(eval(jsonString)));
}

Shiny.addCustomMessageHandler("sendJSONFrame", sendJSONFrame);

function filterJSONFrame(params) {
  let data = eval(params.original_data);
  let filterExpression = preprocessFilterExpression(params.filter_expression);
  let json_frame = filterData(data, filterExpression);
  Shiny.setInputValue("json_frame", JSON.stringify(json_frame));
}

Shiny.addCustomMessageHandler("filterJSONFrame", filterJSONFrame);

function preprocessFilterExpression(filterExpression) {
  return filterExpression.replace(/\b([a-zA-Z_]\w*)\b(?![\'\.])/g, "item.$1");
}

function filterData(data, filter_expression) {
  const expression = new Function('item', `return ${filter_expression};`);
  return data.filter(expression);
}
