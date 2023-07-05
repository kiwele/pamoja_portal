import React, { useEffect, useState } from "react";
import useAxiosPrivate from "../../hooks/useAxiosPrivate";
import { Bar, Pie } from "react-chartjs-2";
import { Chart, registerables } from "chart.js";
import { Box } from "@mui/material";

Chart.register(...registerables);


export const BaarChart = () => {
  const [info, setInfo] = useState([])
  const [levelData, setLevelData] = useState([])
  const axiosPrivate = useAxiosPrivate();
  useEffect(() => {
    axiosPrivate("/members_activeness").then((e) => {
      setInfo(e.data.data);
    });
  }, []);

  useEffect(() => {
    axiosPrivate("/members_levels").then((e) => {
      setLevelData(e.data.data)
    });
  }, []);

  const data1 = {
    labels: ["Junior", "intermidiate" , "Graduate", "Senior" ],
    datasets: [
      {
        label: "Members",
        data: levelData,
        backgroundColor: [
          "rgba(255, 99, 132, 0.2)",
          "rgba(54, 162, 235, 0.2)",
          "rgba(255, 206, 86, 0.2)",
          "rgba(75, 192, 192, 0.2)",
        ],
        borderColor: [
          "rgba(255, 99, 132, 1)",
          "rgba(54, 162, 235, 1)",
          "rgba(255, 206, 86, 1)",
          "rgba(75, 192, 192, 1)",
        ],
        borderWidth: 1,
      },
    ],
  };

  return (
    <Box
      sx={{
        display: "flex",
        pl: 10,
        pr: 10,
      }}
    >
      <Box
        sx={{
          maxWidth: "500px",
          display: "flex",
          justifyContent: "center",
        }}
      >
        <Bar
          data={{
            labels: ["Active", "Normal", "Inactive"],
            datasets: [
              {
                label: "Status",
                data: info,
                backgroundColor: ["blue", "green", "red"],
                borderColor: ["blue", "green", "red"],
                borderWidth: 2,
              },
            ],
          }}
          height={400}
          options={{
            maintainAspectRatio: true,
            scales: {
              y: {
                beginAtZero: true,
                ticks: {
                  beginAtZero: true,
                },
              },
              x: {
                type: "category",
                beginAtZero: true,
                ticks: {
                  beginAtZero: true,
                },
              },
            },
            plugins: {
              legend: {
                labels: {
                  fontSize: 15,
                },
              },
            },
          }}
        />
      </Box>

      <Box
        sx={{
          maxWidth: "500px",
          display: "flex",
          justifyContent: "center",
          ml: "350px",
          pt: 7,
        }}
      >
        <Pie
          data={data1}
          options={{
            plugins: {
              legend: {
                position: "bottom",
              },
            },
          }}
        />
      </Box>
    </Box>
  );
};
