// Function to create JSON frame
function createJSONFrame(jsonString) {
  let jsonData = processJSONData(jsonString);
  Shiny.setInputValue("json_frame", jsonData);
}

Shiny.addCustomMessageHandler("createJSONFrame", createJSONFrame);

// Function to filter JSON frame
function filterJSONFrame(params) {
  let jsonFrame = processJSONData(params.original_data);
  let filterParameters = parseFilterExpression(params.filter_expression);
  let jsonFilteredData = filterData(
    jsonFrame.data,
    jsonFrame.columns,
    filterParameters.columnName,
    filterParameters.condition
  );
  Shiny.setInputValue("json_frame", jsonFilteredData);
}

Shiny.addCustomMessageHandler("filterJSONFrame", filterJSONFrame);

// Helper function to process JSON string
function processJSONData(inputString) {
  const jsonData = JSON.parse(inputString);
  const columns = new Set();
  jsonData.forEach(item => {
    Object.keys(item).forEach(key => {
      columns.add(key);
    });
  });
  const colArray = Array.from(columns);
  const rowData = jsonData.map(item => {
    return colArray.map(col => item[col] !== undefined ? item[col] : '');
  });

  return { columns: colArray, data: rowData };
}

// Helper function to filter data
function filterData(data, columns, columnName, condition) {
  const columnIndex = columns.indexOf(columnName);
  if (columnIndex === -1) {
    throw new Error(`Column '${columnName}' not found.`);
  }
  data = data.filter(row => condition(row[columnIndex]));
  return { columns, data };
}

// Helper function to parse filter expression
function parseFilterExpression(expression) {
  const match = expression.match(/(\w+)\s*(==|>=|<=|>|<)\s*('?[^']+'?)/);
  if (!match) {
    throw new Error('Invalid filter expression');
  }
  const [, columnName, operator, value] = match;

  // Determine the condition function based on the operator
  const conditionFunctions = {
    '==': val => val == (value.startsWith("'") ? value.slice(1, -1) : value),
    '>=': val => val >= Number(value),
    '<=': val => val <= Number(value),
    '>': val => val > Number(value),
    '<': val => val < Number(value)
  };

  return {
    columnName,
    condition: conditionFunctions[operator]
  };
}
