import type { NextConfig } from "next";

// Fix: ML tokens refreshed - sync restored
const nextConfig: NextConfig = {
  // Allowed domains for images
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'http2.mlstatic.com',
      },
      {
        protocol: 'https',
        hostname: '*.mercadolibre.com',
      },
    ],
  },
  // Custom domains configuration
  // Production: traidagency.com
  async headers() {
    return [
      {
        source: '/:path*',
        headers: [
          {
            key: 'X-Frame-Options',
            value: 'DENY',
          },
          {
            key: 'X-Content-Type-Options',
            value: 'nosniff',
          },
        ],
      },
    ];
  },
};

export default nextConfig;
