import { combineReducers } from 'redux';
import projectReducer from './project_reducer';
import locationReducer from './locations_reducer';
import { reducer as formReducer } from 'redux-form';

const rootReducer = combineReducers({
    projects: projectReducer,
    form: formReducer,
    locations: locationReducer
})

export default rootReducer;
