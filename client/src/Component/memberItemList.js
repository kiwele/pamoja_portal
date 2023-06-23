import * as React from "react";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import LogoutIcon from "@mui/icons-material/Logout";
import PeopleIcon from '@mui/icons-material/People';
import HomeIcon from '@mui/icons-material/Home';
import { Link } from "react-router-dom";

import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import { styled } from "@mui/system";

const SidebarContainer = styled("div")`
  display: flex;
  flex-direction: column;
`;

export const membermainListItems = (
  <React.Fragment>
 <SidebarContainer>
  <ListItemButton>
  <Link to="/member_dashboard" style={{ display: 'flex', alignItems: 'center' }}>
    <ListItemIcon>
      <HomeIcon />
    </ListItemIcon>
    <ListItemText primary="Home" />
  </Link>
</ListItemButton>


  <ListItemButton>
  <Link to="/profile" style={{ display: 'flex', alignItems: 'center' }}>
    <ListItemIcon>
    <AccountCircleIcon/>
    </ListItemIcon>
    <ListItemText primary="My profile" />
  </Link>
</ListItemButton>
    

<ListItemButton>
  <Link to="/" style={{ display: 'flex', alignItems: 'center' }}>
    <ListItemIcon>
    <LogoutIcon />
    </ListItemIcon>
    <ListItemText primary="Logout" />
  </Link>
</ListItemButton>
</SidebarContainer>
  </React.Fragment>
);
