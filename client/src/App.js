
import React from "react";
import "./App.css";
import SignInSide from "./pages/login";
import { AuthProvider } from "./context/authProvider";
import { Route, Routes, Link, BrowserRouter } from "react-router-dom";
import UserDashboard from "./pages/user/userDashboard";
import AdminDashboard from "./pages/user/adminDashboard";
import MemberDashboard from "./pages/member/memberDashboard";
import RegisterMember from "./pages/user/registerMember";
import MemberRegister from "./pages/member/memberRegistration";
import MemberProfile from "./pages/member/memberProfile";
import AdminViewMember from "./pages/user/adminViewMember";
import { CssBaseline, ThemeProvider } from "@mui/material";
import {
  createTheme,
} from "@mui/material";


const theme = createTheme({
  palette: {
    background: {
      paper: "#fff",
    },
    text: {
      primary: "#173A5E",
      secondary: "#46505A",
    },
    action: {
      active: "#001E3C",
    },
    // success: {
    //   dark: '#009688',
    // },
  },
});

function App() {

  return (
    <ThemeProvider theme={theme}>
      <AuthProvider>
          <CssBaseline />
        <Routes>
          <Route path="/admin_dashboard" element={<AdminDashboard />} />
          <Route path="/members" element={<UserDashboard />} />
          <Route path="/member/:id" element={<AdminViewMember />} />
          <Route path="/member_dashboard" element={<MemberDashboard />} />
          <Route path="/profile" element={<MemberProfile />} />
          <Route path="/admin_register_member" element={<RegisterMember />} />
          <Route path="/member_register" element={<MemberRegister />} />
          
          <Route path="/*" element={<SignInSide />} />
        </Routes>
      </AuthProvider>
      </ThemeProvider>
  );
  
}

export default App;