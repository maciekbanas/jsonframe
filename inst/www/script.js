// Function to create JSON frame
function createJSONFrame(jsonString) {
  Shiny.setInputValue("json_frame", jsonString);
}

Shiny.addCustomMessageHandler("createJSONFrame", createJSONFrame);

// Function to filter JSON frame
function filterJSONFrame(params) {
  let data = JSON.parse(params.original_data);
  let filterExpression = preprocessFilterExpression(params.filter_expression);
  let filteredData = filterData(data, filterExpression);
  Shiny.setInputValue("json_frame", JSON.stringify(filteredData));
}

Shiny.addCustomMessageHandler("filterJSONFrame", filterJSONFrame);

function preprocessFilterExpression(filterExpression) {
  return filterExpression.replace(/\b([a-zA-Z_]\w*)\b(?![\'\.])/g, "item.$1");
}

function filterData(data, filter_expression) {
  const expression = new Function('item', `return ${filter_expression};`);
  return data.filter(expression);
}
