import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom';

import LoginContainer from './session/login_container';
import SignUpContainer from './session/signup_container';
import SplashIndex from './splash/splash_index';

const App = () => {
  return (
    <div className="app-body">
      <Switch>
        <Route exact path="/login" component={LoginContainer} />
        <Route exact path="/signup" component={SignUpContainer} />
        <Route exact path="/" component={SplashIndex} />
      </Switch>
    </div>
  );
};

export default App;
