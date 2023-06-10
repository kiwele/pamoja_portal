import * as React from "react";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import LogoutIcon from "@mui/icons-material/Logout";
import PeopleIcon from "@mui/icons-material/People";
import HomeIcon from "@mui/icons-material/Home";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import { Link } from "react-router-dom";

export const usermainListItems = (
  <React.Fragment>
    <ListItemButton>
      <Link
        to="/admin_dashboard"
        style={{ display: "flex", alignItems: "center" }}
      >
        <ListItemIcon>
          <HomeIcon />
        </ListItemIcon>
        <ListItemText primary="Home" />
      </Link>
    </ListItemButton>

    <ListItemButton>
      <Link to="/members" style={{ display: "flex", alignItems: "center" }}>
        <ListItemIcon>
          <PeopleIcon />
        </ListItemIcon>
        <ListItemText primary="members" />
      </Link>
    </ListItemButton>

    <ListItemButton>
      <Link to="/" style={{ display: "flex", alignItems: "center" }}>
        <ListItemIcon>
          <LogoutIcon />
        </ListItemIcon>
        <ListItemText primary="Logout" />
      </Link>
    </ListItemButton>
  </React.Fragment>
);
