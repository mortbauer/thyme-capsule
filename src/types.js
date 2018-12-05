// @flow
import type { $Request } from 'express';

export type ThymeRequest = {
  body: { [key: string]: null | string | boolean | number };
  user?: {
    id: string;
    password: string;
    premium: boolean;
    update: (updates: any) => any;
  };
} & $Request;

export type ThymeCapability = 'premium' | 'project_rates' | 'insights';
export type ThymeCapabilities = ThymeCapability[];
