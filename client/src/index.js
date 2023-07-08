import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import { Route, Routes, Link, BrowserRouter } from "react-router-dom";
import UserDashboard from "./pages/user/userDashboard";
import AdminDashboard from "./pages/user/adminDashboard";
import MemberDashboard from "./pages/member/memberDashboard";
import RegisterMember from "./pages/user/registerMember";
import MemberRegister from "./pages/member/memberRegistration";
import MemberProfile from "./pages/member/memberProfile";
import AdminViewMember from "./pages/user/adminViewMember";
import { AuthProvider } from "./context/authProvider";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <div>
    <BrowserRouter>
      <AuthProvider>
        <Routes>
          <Route path="/admin_dashboard" element={<AdminDashboard />} />
          <Route path="/members" element={<UserDashboard />} />
          <Route path="/member/:id" element={<AdminViewMember />} />
          <Route path="/member_dashboard" element={<MemberDashboard />} />
          <Route path="/profile" element={<MemberProfile />} />
          <Route path="/admin_register_member" element={<RegisterMember />} />
          <Route path="/member_register" element={<MemberRegister />} />
          
          <Route path="/*" element={<App />} />
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  </div>
);
