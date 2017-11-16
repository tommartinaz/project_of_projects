import axios from 'axios';
import {
    FETCH_LOCATIONS,
    BASE_URL
} from './types';

export const fetch_locations = () => {
    return {
        type: FETCH_LOCATIONS,
        payload: axios.get(`${BASE_URL}/locations`)
    }
}
