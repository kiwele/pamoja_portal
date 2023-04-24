import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import Home from "./pages/Home";
import { Route, Routes, Link, BrowserRouter } from "react-router-dom";
import Register from "./pages/register";
import UserDashboard from "./pages/user/userDashboard";
import AdminDashboard from "./pages/user/adminDashboard";
import MemberDashboard from "./pages/member/memberDashboard";
import RegisterMember from "./pages/user/registerMember";
import MemberProfile from "./pages/member/memberProfile";
import { AuthProvider } from "./context/authProvider";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <div>
    <BrowserRouter>
      <AuthProvider>
        <Routes>
          <Route path="/home" element={<Home />} />
          <Route path="/register" element={<Register />} />
          <Route path="/admin_dashboard" element={<AdminDashboard />} />
          <Route path="/members" element={<UserDashboard />} />
          <Route path="/member_dashboard" element={<MemberDashboard />} />
          <Route path="/profile" element={<MemberProfile />} />
          <Route path="/register_member" element={<RegisterMember />} />
          
          <Route path="/*" element={<App />} />
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  </div>
);