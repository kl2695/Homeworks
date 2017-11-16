import merge from 'lodash/merge'; 

const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  switch(action.type){
    case 'SWITCH_CURRENCY':
      let nextState = merge({},state);
      nextState.baseCurrency = action.baseCurrency;
      nextState.rates = action.rates; 
      return nextState; 
    default: 
      return state;
  }
  
   // remove this and fill out the body of the reducer function
};

export default reducer;
