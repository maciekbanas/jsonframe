function createJSONFrame(jsonString) {
  let jsonData  = processJSONData(jsonString);
  Shiny.setInputValue("json_frame", jsonData);
}

Shiny.addCustomMessageHandler("createJSONFrame", createJSONFrame);

function filterJSONFrame(filterExpression) {
  let jsonFrame = Shiny.shinyapp.$inputValues["json_frame"];
  let filterParameters = parseFilterExpression(filterExpression);
  let jsonFilteredData = filterData(
    data = jsonFrame.data,
    columns = jsonFrame.columns,
    columnName = filterParameters.columnName,
    condition = filterParameters.condition
  )
  Shiny.setInputValue("json_frame", jsonFilteredData);
}

Shiny.addCustomMessageHandler("filterJSONFrame", filterJSONFrame);

function getJSONData(inputString) {
  let jsonString = inputString.replace(/'/g, '"').replace(/(\w+):/g, '"$1":');
  const jsonData = JSON.parse(jsonString);
  return(jsonData);
}

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
    return colArray.map(col => {
      if (typeof item[col] === 'object') return JSON.stringify(item[col]);
      return item[col] !== undefined ? item[col] : '';
    });
  });

  return{ columns: colArray, data: rowData }
}

function filterData(data, columns, columnName, condition) {
    const columnIndex = columns.indexOf(columnName);
    if (columnIndex === -1) {
        throw new Error(`Column '${columnName}' not found.`);
    }
    data = data.filter(row => condition(row[columnIndex]));
    return{columns, data}
}

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
    }
}