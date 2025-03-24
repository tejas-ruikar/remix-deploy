import { Link } from "@remix-run/react";

export default function About() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center">
      <h1 className="text-4xl font-bold text-gray-800">About Us</h1>
      <p className="mt-2 text-lg text-gray-600">This is a Remix-powered app!</p>
      <Link
        to="/"
        className="mt-4 px-4 py-2 bg-green-500 text-white rounded hover:bg-green-700"
      >
        Back to Home
      </Link>
    </div>
  );
}
