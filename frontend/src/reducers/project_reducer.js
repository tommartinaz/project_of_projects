import _ from 'lodash';
import {
    FETCH_PROJECTS_FULFILLED,
    UPDATE_PROJECT_FULFILLED
 } from '../actions/types'

export default (state = {}, action) => {
    switch (action.type) {
        case FETCH_PROJECTS_FULFILLED:
          return _.mapKeys(action.payload.data, 'id');
        case UPDATE_PROJECT_FULFILLED:
          return _.mapKeys(action.payload.data, 'id');
        default:
          return state;
    }
}
