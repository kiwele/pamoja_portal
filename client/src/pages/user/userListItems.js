import * as React from "react";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import LogoutIcon from "@mui/icons-material/Logout";
import PeopleIcon from '@mui/icons-material/People';
import HomeIcon from '@mui/icons-material/Home';
import AccountCircleIcon from '@mui/icons-material/AccountCircle';

export const usermainListItems = (
  <React.Fragment>

    <ListItemButton
      onClick={() => {
        // console.log('here');
        window.location.pathname = "/admin_dashboard";
      }}
    >
      <ListItemIcon>
       <HomeIcon/>
      </ListItemIcon>
      <ListItemText primary="Home" />
    </ListItemButton>

    <ListItemButton
      onClick={() => {
        // console.log('here');
        window.location.pathname = "/members";
      }}
    >
      <ListItemIcon>
       <PeopleIcon/>
      </ListItemIcon>
      <ListItemText primary="members" />
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
