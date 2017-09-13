import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';
import merge from 'lodash/merge';

const GiphysReducer = (state = [], action) => {
  switch(action.type) {
    case(RECEIVE_SEARCH_GIPHYS):
      return action.giphys;
    default:
      return state;
  }
};

export default GiphysReducer;
