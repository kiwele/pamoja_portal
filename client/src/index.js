import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import { Route, Routes, Link, BrowserRouter } from "react-router-dom";
// import UserDashboard from "./pages/user/userDashboard";
// import AdminDashboard from "./pages/user/adminDashboard";
// import MemberDashboard from "./pages/member/memberDashboard";
// import RegisterMember from "./pages/user/registerMember";
// import MemberRegister from "./pages/member/memberRegistration";
// import MemberProfile from "./pages/member/memberProfile";
// import AdminViewMember from "./pages/user/adminViewMember";
// import { AuthProvider } from "./context/authProvider";


const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <div>
    <BrowserRouter>
     <App />
    </BrowserRouter>
  </div>
);
