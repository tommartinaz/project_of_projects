import axios from 'axios';
import {
    FETCH_PROJECTS,
    UPDATE_PROJECT,
    BASE_URL
} from './types';

export const fetch_projects = () => {
    return {
        type: FETCH_PROJECTS,
        payload: axios.get(`${BASE_URL}/projects`)
    }
}

export const updateProject = (vals) => {
  console.log("VALS", vals);
  return {
    type: UPDATE_PROJECT,
    payload: axios.post(`${BASE_URL}/projects/edit/${vals.id}`, vals)
  }
}
