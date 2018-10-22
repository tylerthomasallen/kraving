import { combineReducers } from 'redux';

import { entities } from './entities_reducer';
import { session } from './session/session_reducer';
import { errors } from './session//session_errors_reducer';

const rootReducer = combineReducers({
  entities,
  session,
  errors,
});

export default rootReducer;
