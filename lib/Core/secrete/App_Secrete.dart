class AppSecrete{
  static const String supabaseUrl = "https://zsxmewmpcfqkkwzrwrox.supabase.co";

  // FIX: Renamed variable from 'supabaseanonKey' to 'supabaseAnonKey' for consistency.
  // The key provided looks like a 'publishable' key, which is the new standard and replaces the old 'anon' key.
  // It is safe to expose this key in a client-side application like Flutter, as long as you have
  // Row Level Security (RLS) enabled on your tables in the Supabase dashboard. [11]
  //
  // IMPORTANT: Please double-check this key is correct and has not been revoked.
  // You can find the correct key in your Supabase Project -> Settings -> API -> Project API keys. [8]
  static const String supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpzeG1ld21wY2Zxa2t3enJ3cm94Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc4ODg0NDksImV4cCI6MjAyMzQ2NDQ0OX0.sb_publishable_Cr070chz2nmIxrHX_8uglg_1dXrB-8S"; // <-- PASTE YOUR ACTUAL KEY HERE
}