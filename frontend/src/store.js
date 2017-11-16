import {applyMiddleware, createStore} from 'redux';
import logger from 'redux-logger';
import promises from 'redux-promise-middleware';
import rootReducer from './reducers';

export default (initialState) => {
    return createStore(
        rootReducer, applyMiddleware(logger, promises())
    );
}
