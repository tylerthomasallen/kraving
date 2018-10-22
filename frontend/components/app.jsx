import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom';

import LoginContainer from './session/login_container';
import SignUpContainer from './session/signup_container';

const App = () => {
  return (
    <div className="app-body">
      <Switch>
        <Route exact path="/login" component={LoginContainer} />
        <Route exact path="/signup" component={SignUpContainer} />
        <Redirect to="/"/>
      </Switch>
    </div>
  );
};

export default App;
