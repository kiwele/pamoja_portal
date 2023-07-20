import axios from "../axios"
import useAuth from "./useAuth";

// const BASE_URL = process.env.BASE_URL;s
function useRefreshToken() {
    const { setAuth } = useAuth();
   
    const refresh = async () => {

        const response = await axios.get('/token', {
            withCredentials: true
        });
        
        setAuth(prev => {
            return { ...prev, role:response.data.role, accessToken:response.data.accessToken}
        });
        return response.data.accessToken;
    }
  return refresh;
}

export default useRefreshToken;
