import { Link } from "@remix-run/react";

export default function Index() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center">
      <h1 className="text-4xl font-bold text-gray-800">Welcome to My Remix App!</h1>
      <Link
        to="/about"
        className="mt-4 px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700"
      >
        Go to About Page
      </Link>
    </div>
  );
}
