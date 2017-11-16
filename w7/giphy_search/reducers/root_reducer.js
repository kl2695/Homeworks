import { combineReducers } from 'redux';

import giphysReducer from './giphys_reducer';


export default function rootReducer(state = {}, action) {
    console.log("im here");
    return {
      giphys: giphysReducer(state.giphys, action),
    }
  }