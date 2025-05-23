function sendJSONFrame(jsonString) {
  Shiny.setInputValue("json_frame", JSON.stringify(eval(jsonString)));
}
Shiny.addCustomMessageHandler("sendJSONFrame", sendJSONFrame);

function filterJSONFrame(params) {
  let data = eval(params.original_data);
  let filterExpression = preprocessFilterExpression(params.filter_expression);
  Shiny.setInputValue("jsonframe_translation", filterExpression);
  let filteredJSON = filterData(data, filterExpression);
  Shiny.setInputValue("json_frame", JSON.stringify(filteredJSON));
}
Shiny.addCustomMessageHandler("filterJSONFrame", filterJSONFrame);

function preprocessFilterExpression(filterExpression) {
  const regex = /(\b[a-zA-Z_]\w*\b)(?=(?:(?:[^'"\\]*["'][^'"\\]*["'])*[^'"\\]*$)(?![\'\.]))/g;
  const processedExpression = filterExpression.replace(regex, (match) => {
    if (/['"]/.test(match)) {
      return match;
    } else {
      return 'item.' + match;
    }
  });
  return processedExpression;
}

function filterData(data, filter_expression) {
  const expression = new Function('item', `return ${filter_expression};`);
  return data.filter(expression);
}
