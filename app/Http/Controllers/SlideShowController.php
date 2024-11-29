<?php

namespace App\Http\Controllers;

use App\Models\Logo;
use Illuminate\Http\Request;
use App\Models\SlideShow;
use App\Models\Product;
use App\Models\Footers;
use Exception;
use Illuminate\Support\Facades\Storage;

class SlideShowController extends Controller
{

    public function search(Request $request)
    {
        try {

            $query = $request->input('query');
            $listSlide = SlideShow::where('product.name', 'like', '%' . $query . '%')
                ->paginate(3);
            return view('slide-show.list', compact('listSlide', 'query'));
        } catch (Exception $e) {
            return back()->with(['Error' => 'Không tìm thấy sản phẩm']);
        }
    }
    public function getList()
    {
        $listSlide = SlideShow::paginate(3);
        $footers = Footers::paginate(5);
        $loGo = Logo::first();
        return view('slide-show.list', compact('listSlide', 'loGo', 'footers'));
    }

    public function addNew()
    {
        $listProduct = Product::all();
        return view('slide-show.add-new', compact('listProduct'));
    }
    public function hdAddNew(Request $request)
    {
        try {
            $file = $request->file('img_url');
            $slideshow = new SlideShow();
            if (isset($file)) {
                $path = $file->move('slide');
                $slideshow->img_url = $path;
            }
            $slideshow->product_id = $request->product;
            $slideshow->save();

            return redirect()->route('slide-show.list')->with(['Success' => 'Thêm Slideshow thành công!']);
        } catch (Exception $e) {
            return back()->with("error: " . $e);
        }
    }
    public function upDate($id)
    {
        $slide = SlideShow::findOrFail($id);
        $dsProduct = Product::all();
        if (empty($slide)) {
            return redirect()->route('slide-show.list')->with(['Error' => "Tài khoản này không tồn tại!"]);
        }
        return view('slide-show.update', compact('slide', 'dsProduct'));
    }
    //update slide
    public function hdUpdate(Request $request, $id)
    {

        try {

            $file = $request->file('img_url');
            $slideshow = SlideShow::findOrFail($id);

            if (isset($file)) {
                Storage::delete($slideshow->img_url);
                $path = $file->move('slide');
                $slideshow->img_url = $path;
            }
            $slideshow->product_id = $request->product_id;
            $slideshow->save();
            return redirect()->route('slide-show.list')->with(['Success' => "Cập nhật slide {$slideshow->id} thành công!"]);
        } catch (Exception $e) {
            return back()->withInput()->with(['error' => "Error: " . $e->getMessage()]);
        }
    }
    //delete slide
    public function updateLogo(Request $request, $id)
    {

        try {
            $file = $request->file('logo');
            $loGo = Logo::findOrFail($id);

            if (isset($file)) {
                Storage::delete($loGo->img_url);
                $path = $file->move('logo');
                $loGo->img_url = $path;
            }
            $loGo->save();
            return redirect()->route('slide-show.list')->with(['Success' => "Cập nhật logo thành công!"]);
        } catch (Exception $e) {
            return back()->withInput()->with(['error' => "Error: " . $e->getMessage()]);
        }
    }

    // footer
    public function listFooters()
    {
        // Lấy tất cả các footer từ cơ sở dữ liệu
        $footers = Footers::paginate(5); // Hoặc Footers::get() nếu không cần phân trang
        // Trả về view với biến footers
        return view('slide-show.list', compact('footers'));
    }

    /**
     * Hiển thị chi tiết một Footer
     */
    public function showFooter($id)
    {
        $footer = Footers::find($id);

        if (!$footer) {
            return back()->with(['Error' => 'Footer không tồn tại']);
        }

        return view('footer.detail', compact('footer'));
    }

    /**
     * Hiển thị form thêm Footer
     */
    public function addFooter()
    {
        return view('footer.add');
    }

    /**
     * Xử lý thêm mới Footer
     */
    public function storeFooter(Request $request)
    {
        try {
            $validated = $request->validate([
                'address' => 'nullable|string',
                'description' => 'nullable|string',
                'social_link' => 'nullable|string',
                'contact' => 'nullable|string',
            ]);

            Footers::create($validated);

            return redirect()->route('footer.list')->with(['Success' => 'Thêm Footer thành công!']);
        } catch (Exception $e) {
            return back()->withInput()->with(['Error' => 'Lỗi: ' . $e->getMessage()]);
        }
    }

    /**
     * Hiển thị form cập nhật Footer
     */
    public function editFooter($id)
    {
        $footer = Footers::findOrFail($id);

        if (!$footer) {
            return redirect()->route('slide-show.list')->with(['Error' => 'Footer không tồn tại']);
        }

        return view('slide-show.updatefooters', compact('footer'));
    }

    /**
     * Xử lý cập nhật Footer
     */
    public function updateFooter(Request $request, $id)
    {
        try {
            $footer = Footers::findOrFail($id);

            $validated = $request->validate([
                'address' => 'nullable|string',
                'description' => 'nullable|string',
                'social_link' => 'nullable|string',
                'contact' => 'nullable|string',
            ]);

            $footer->update($validated);

            return redirect()->route('slide-show.list')->with(['Success' => 'Cập nhật Footer thành công!']);
        } catch (Exception $e) {
            return back()->withInput()->with(['Error' => 'Lỗi: ' . $e->getMessage()]);
        }
    }

    /**
     * Xóa một Footer
     */
    public function deleteFooter($id)
    {
        try {
            $footer = Footers::findOrFail($id);

            $footer->delete();

            return redirect()->route('footer.list')->with(['Success' => 'Xóa Footer thành công!']);
        } catch (Exception $e) {
            return back()->with(['Error' => 'Lỗi: ' . $e->getMessage()]);
        }
    }
}
