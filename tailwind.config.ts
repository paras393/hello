import type { Config } from "tailwindcss";
const config: Config = {
  content: ["./src/**/*.{js,ts,jsx,tsx,mdx}"],
  theme: { extend: { colors: { ink: "#17324d", teal: { DEFAULT: "#0f766e", 50: "#effcf9", 100: "#d8f4ee", 600: "#0f766e", 700: "#0b5f59" }, mist: "#f4f7f8", line: "#d9e3e7", sun: "#f2b84b" }, fontFamily: { sans: ["Inter", "ui-sans-serif", "system-ui", "sans-serif"] }, boxShadow: { soft: "0 10px 30px rgba(23,50,77,.08)", card: "0 3px 14px rgba(23,50,77,.06)" }, borderRadius: { xl: ".85rem", "2xl": "1.1rem" } } },
  plugins: []
};
export default config;
