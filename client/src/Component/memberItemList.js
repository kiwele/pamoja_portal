import * as React from "react";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import LogoutIcon from "@mui/icons-material/Logout";
import PeopleIcon from '@mui/icons-material/People';

export const membermainListItems = (
  <React.Fragment>
      <ListItemButton
      onClick={() => {
        // console.log('here');
        window.location.pathname = "/member_dashboard";
      }}
    >
      <ListItemIcon>
       <PeopleIcon/>
      </ListItemIcon>
      <ListItemText primary="Home" />
    </ListItemButton>

    <ListItemButton
      onClick={() => {
        // console.log('here');
        window.location.pathname = "/profile";
      }}
    >
      <ListItemIcon>
       <PeopleIcon/>
      </ListItemIcon>
      <ListItemText primary="My profile" />
    </ListItemButton>


    <ListItemButton
      onClick={() => {
        window.location.pathname = "/";
      }}
    >
      <ListItemIcon>
        <LogoutIcon />
      </ListItemIcon>
      <ListItemText primary="Logout" />
    </ListItemButton>
  </React.Fragment>
);
