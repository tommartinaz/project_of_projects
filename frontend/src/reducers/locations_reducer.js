import _ from 'lodash';
import {
  FETCH_LOCATIONS_FULFILLED
} from '../actions/types';

export default (state = {}, action) => {
  switch(action.type) {
    case FETCH_LOCATIONS_FULFILLED:
      return _.mapKeys(action.payload.data, 'id')
    default:
      return state;
  }
}
