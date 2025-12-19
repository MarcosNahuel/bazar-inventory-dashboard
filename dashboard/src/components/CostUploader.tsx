'use client';

import { useState, useRef } from 'react';
import { Upload, FileSpreadsheet, Check, X, Download, AlertTriangle } from 'lucide-react';

interface CostData {
  sku: string;
  codigo_ml: string;
  costo: number;
  proveedor?: string;
}

interface CostUploaderProps {
  onUpload: (costs: CostData[]) => Promise<void>;
}

export function CostUploader({ onUpload }: CostUploaderProps) {
  const [file, setFile] = useState<File | null>(null);
  const [preview, setPreview] = useState<CostData[]>([]);
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleFileSelect = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const selectedFile = e.target.files?.[0];
    if (!selectedFile) return;

    setFile(selectedFile);
    setError(null);
    setSuccess(false);

    try {
      const formData = new FormData();
      formData.append('file', selectedFile);

      const response = await fetch('/api/costs/preview', {
        method: 'POST',
        body: formData,
      });

      if (!response.ok) {
        throw new Error('Error al procesar archivo');
      }

      const data = await response.json();
      setPreview(data.costs);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error al procesar archivo');
      setPreview([]);
    }
  };

  const handleUpload = async () => {
    if (preview.length === 0) return;

    setUploading(true);
    setError(null);

    try {
      await onUpload(preview);
      setSuccess(true);
      setFile(null);
      setPreview([]);
      if (fileInputRef.current) {
        fileInputRef.current.value = '';
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error al cargar costos');
    } finally {
      setUploading(false);
    }
  };

  const downloadTemplate = () => {
    const csvContent = `SKU,Codigo_ML,Costo,Proveedor
SKU-001,MLC1234567890,15000,Proveedor A
SKU-002,MLC0987654321,22500,Proveedor B`;

    const blob = new Blob([csvContent], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'plantilla_costos.csv';
    a.click();
    URL.revokeObjectURL(url);
  };

  return (
    <div className="bg-white rounded-xl shadow-sm p-6">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-2">
          <FileSpreadsheet className="w-5 h-5 text-green-600" />
          <h3 className="text-lg font-semibold text-gray-900">Cargar Costos en Lote</h3>
        </div>
        <button
          onClick={downloadTemplate}
          className="flex items-center gap-2 text-sm text-blue-600 hover:text-blue-800"
        >
          <Download className="w-4 h-4" />
          Descargar Plantilla
        </button>
      </div>

      <p className="text-sm text-gray-500 mb-4">
        Sube un archivo Excel (.xlsx) o CSV con las columnas: SKU, Codigo_ML, Costo, Proveedor (opcional)
      </p>

      {/* Drop zone */}
      <div
        className={`
          border-2 border-dashed rounded-lg p-8 text-center cursor-pointer
          transition-colors duration-200
          ${file ? 'border-green-400 bg-green-50' : 'border-gray-300 hover:border-blue-400 hover:bg-blue-50'}
        `}
        onClick={() => fileInputRef.current?.click()}
      >
        <input
          ref={fileInputRef}
          type="file"
          accept=".xlsx,.xls,.csv"
          onChange={handleFileSelect}
          className="hidden"
        />

        {file ? (
          <div className="flex items-center justify-center gap-2">
            <Check className="w-6 h-6 text-green-600" />
            <span className="text-green-700 font-medium">{file.name}</span>
            <button
              onClick={(e) => {
                e.stopPropagation();
                setFile(null);
                setPreview([]);
                if (fileInputRef.current) fileInputRef.current.value = '';
              }}
              className="ml-2 text-gray-400 hover:text-red-500"
            >
              <X className="w-5 h-5" />
            </button>
          </div>
        ) : (
          <div>
            <Upload className="w-12 h-12 text-gray-400 mx-auto mb-2" />
            <p className="text-gray-600">
              Arrastra un archivo aquí o <span className="text-blue-600">haz clic para seleccionar</span>
            </p>
          </div>
        )}
      </div>

      {/* Error message */}
      {error && (
        <div className="mt-4 p-3 bg-red-50 border border-red-200 rounded-lg flex items-center gap-2">
          <AlertTriangle className="w-5 h-5 text-red-500" />
          <span className="text-red-700 text-sm">{error}</span>
        </div>
      )}

      {/* Success message */}
      {success && (
        <div className="mt-4 p-3 bg-green-50 border border-green-200 rounded-lg flex items-center gap-2">
          <Check className="w-5 h-5 text-green-500" />
          <span className="text-green-700 text-sm">Costos actualizados exitosamente</span>
        </div>
      )}

      {/* Preview table */}
      {preview.length > 0 && (
        <div className="mt-4">
          <h4 className="font-medium text-gray-700 mb-2">
            Vista previa ({preview.length} productos)
          </h4>
          <div className="max-h-64 overflow-auto border rounded-lg">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50 sticky top-0">
                <tr>
                  <th className="px-4 py-2 text-left text-xs font-medium text-gray-500">SKU</th>
                  <th className="px-4 py-2 text-left text-xs font-medium text-gray-500">Código ML</th>
                  <th className="px-4 py-2 text-right text-xs font-medium text-gray-500">Costo</th>
                  <th className="px-4 py-2 text-left text-xs font-medium text-gray-500">Proveedor</th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {preview.slice(0, 10).map((row, index) => (
                  <tr key={index}>
                    <td className="px-4 py-2 text-sm text-gray-900">{row.sku}</td>
                    <td className="px-4 py-2 text-sm text-gray-500">{row.codigo_ml}</td>
                    <td className="px-4 py-2 text-sm text-gray-900 text-right">
                      ${row.costo.toLocaleString()}
                    </td>
                    <td className="px-4 py-2 text-sm text-gray-500">{row.proveedor || '-'}</td>
                  </tr>
                ))}
              </tbody>
            </table>
            {preview.length > 10 && (
              <p className="text-center text-sm text-gray-500 py-2">
                ...y {preview.length - 10} productos más
              </p>
            )}
          </div>

          <button
            onClick={handleUpload}
            disabled={uploading}
            className="mt-4 w-full bg-green-600 text-white py-2 px-4 rounded-lg hover:bg-green-700 disabled:opacity-50 flex items-center justify-center gap-2"
          >
            {uploading ? (
              <>
                <div className="w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin" />
                Actualizando...
              </>
            ) : (
              <>
                <Check className="w-5 h-5" />
                Actualizar {preview.length} Costos
              </>
            )}
          </button>
        </div>
      )}
    </div>
  );
}
