import React from 'react';
import { Route, Switch, Redirect } from 'react-router-dom';

import LoginContainer from './session/login_container';
import SignUpContainer from './session/signup_container';
import SplashIndex from './splash/splash_index';
import GoogleMapContainer from './google_map/google_map';
import SearchContainer from './google_map/search';

const App = () => {
  return (
    <div className="app-body">
      <Switch>
        <Route exact path="/login" component={LoginContainer} />
        <Route exact path="/signup" component={SignUpContainer} />
        <Route exact path="/map" component={SearchContainer} />
        <Route exact path="/" component={SplashIndex} />
      </Switch>
    </div>
  );
};

export default App;
